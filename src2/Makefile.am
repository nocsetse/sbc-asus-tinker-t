CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

python:
	@$(PY39) -m venv _build
	( \
		source ../_build/bin/activate; \
		_build/bin/python -m pip install --index-url http://storage1.lab.bitsmasher.net/pypi \
			--extra-index-url https://pypi.org/simple \
			--trusted-host storage1.lab.bitsmasher.net \
			-r src2/requirements.txt; \
	)
