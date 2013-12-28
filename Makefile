test: $(PHONY)
	$(QUIET)rbenv each -v bundle install
	$(QUIET)rbenv each -v rake test

