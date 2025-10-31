#!/usr/bin/env python3
"""
Simple markdown to PDF converter optimized for the project's report.
It renders headings, paragraphs and embedded images (markdown image links).
Images are resized to fit the page width to help the document fit within two pages.

Usage: python scripts/md_to_pdf.py
Produces: docs/ReportUnsupervisedMachineLearningWorkshop.pdf
"""
import os
import re
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image as RLImage
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib import utils
from PIL import Image as PILImage


ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
MD_PATH = os.path.join(ROOT, 'docs', 'ReportUnsupervisedMachineLearningWorkshop.md')
OUT_PDF = os.path.join(ROOT, 'docs', 'ReportUnsupervisedMachineLearningWorkshop.pdf')


def pil_image_size(path):
    try:
        with PILImage.open(path) as img:
            return img.size  # (w, h) in pixels
    except Exception:
        return None


def make_image_flowable(path, max_width_pt):
    # Try to open and resize image while preserving aspect ratio
    try:
        # Resolve path relative to MD file if necessary
        if not os.path.isabs(path):
            candidate = os.path.join(os.path.dirname(MD_PATH), path)
            if os.path.exists(candidate):
                path = candidate

        img_size = pil_image_size(path)
        if img_size is None:
            return None

        img = utils.ImageReader(path)
        iw, ih = img.getSize()  # in pixels
        # ReportLab uses points; assume 1px ~= 1pt for sizing relative to page
        # Compute scale so width <= max_width_pt
        scale = min(1.0, max_width_pt / float(iw))
        width = iw * scale
        height = ih * scale
        rl_img = RLImage(path, width=width, height=height)
        return rl_img
    except Exception:
        return None


def md_to_flowables(md_text, page_width_pt):
    styles = getSampleStyleSheet()
    # Custom styles (smaller base font to help fit 2 pages)
    # Use more compact styles to help fit content into two pages
    body_style = ParagraphStyle(
        'Body', parent=styles['Normal'], fontSize=8, leading=9)
    h1_style = ParagraphStyle('H1', parent=styles['Heading1'], fontSize=12, leading=14)
    h2_style = ParagraphStyle('H2', parent=styles['Heading2'], fontSize=10, leading=12)
    bullet_style = ParagraphStyle('Bullet', parent=body_style, leftIndent=10)

    flowables = []
    blocks = re.split(r"\n\s*\n", md_text)
    max_img_width = page_width_pt - 2 * (12 * mm)  # page width minus tighter margins

    img_pattern = re.compile(r'!\[[^\]]*\]\(([^)]+)\)')

    for block in blocks:
        block = block.strip()
        if not block:
            continue

        # Heading
        if block.startswith('# '):
            txt = block.lstrip('# ').strip()
            flowables.append(Paragraph(txt, h1_style))
            flowables.append(Spacer(1, 4))
            continue
        if block.startswith('## '):
            txt = block.lstrip('#').strip()
            flowables.append(Paragraph(txt, h2_style))
            flowables.append(Spacer(1, 3))
            continue

        # Images within block
        m = img_pattern.search(block)
        if m:
            # Text before image
            pre = img_pattern.sub('', block).strip()
            if pre:
                # convert simple bullets
                if pre.startswith('- '):
                    lines = [l.strip() for l in pre.splitlines() if l.strip()]
                    for ln in lines:
                        if ln.startswith('- '):
                            flowables.append(Paragraph('• ' + ln[2:].strip(), bullet_style))
                        else:
                            flowables.append(Paragraph(ln, body_style))
                else:
                    flowables.append(Paragraph(pre.replace('\n', '<br/>'), body_style))
            img_path = m.group(1)
            # Normalize relative paths like ../results/figures/... relative to docs
            if img_path.startswith('../') or img_path.startswith('./'):
                resolved = os.path.normpath(os.path.join(os.path.dirname(MD_PATH), img_path))
            else:
                resolved = img_path
            rl_img = make_image_flowable(resolved, max_img_width)
            if rl_img:
                # Add image with a very small spacer to conserve space
                flowables.append(rl_img)
                flowables.append(Spacer(1, 3))
            continue

        # Bullet list lines
        if any(line.strip().startswith('- ') for line in block.splitlines()):
            for ln in block.splitlines():
                ln = ln.strip()
                if ln.startswith('- '):
                    flowables.append(Paragraph('• ' + ln[2:].strip(), bullet_style))
                else:
                    flowables.append(Paragraph(ln, body_style))
            flowables.append(Spacer(1, 2))
            continue

        # Default paragraph
        # Escape XML-sensitive chars minimally
        safe = block.replace('&', '&amp;').replace('%', '&#37;')
        safe = safe.replace('<', '&lt;').replace('>', '&gt;')
    flowables.append(Paragraph(safe.replace('\n', '<br/>'), body_style))
    flowables.append(Spacer(1, 2))

    return flowables


def build_pdf():
    if not os.path.exists(MD_PATH):
        print('ERROR: Markdown file not found:', MD_PATH)
        return 1

    with open(MD_PATH, 'r', encoding='utf-8') as f:
        md_text = f.read()

    # Use tighter margins to fit to two pages
    doc = SimpleDocTemplate(OUT_PDF, pagesize=A4,
                            leftMargin=12 * mm, rightMargin=12 * mm,
                            topMargin=12 * mm, bottomMargin=12 * mm)
    page_width_pt, _ = A4
    flowables = md_to_flowables(md_text, page_width_pt)

    # Build PDF
    doc.build(flowables)
    print('\n✅ PDF generated at:', OUT_PDF)
    return 0


if __name__ == '__main__':
    build_pdf()
