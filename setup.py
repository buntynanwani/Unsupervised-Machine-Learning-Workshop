from setuptools import setup, find_packages

setup(
    name="unsupervised-ml-workshop",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "numpy>=1.24.0",
        "pandas>=2.0.0",
        "scikit-learn>=1.3.0",
        "matplotlib>=3.7.0",
        "seaborn>=0.12.0",
        "plotly>=5.14.0",
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="Unsupervised Machine Learning Workshop",
    python_requires=">=3.8",
)
