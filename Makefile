NAMESPACE=dmmmd
SHELL := /bin/bash


evalcode:
	/home/dmmmd/.virtualenvs/seven-notebooks/bin/watchmedo shell-command \
		--patterns="*seeds.rb;" \
		--command='clear && rails db:environment:set RAILS_ENV=development; rails db:reset '\
		-w -W \
		--recursive .
