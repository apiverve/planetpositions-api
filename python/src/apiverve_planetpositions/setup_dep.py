from setuptools import setup, find_packages

setup(
    name='apiverve_planetpositions',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Planet Positions locates solar system bodies for any observer coordinates on Earth. It checks if the sun, moon, or planets sit below the horizon, while paid plans add celestial coordinates and distance.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/planetpositions?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
