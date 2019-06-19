.PHONY: install
install:
	@virtualenv env && . env/bin/activate && pip install -r requirements.txt

.PHONY: run
run:
	@source env/bin/activate && python app.py
