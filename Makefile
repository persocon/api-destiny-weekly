.PHONY: help dist php-server

NO_COLOR=\033[0m
CYAN=\033[36;1m
GREEN=\033[32;1m
CLOUD="☁"
ARROW="➜"

help:
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}Hey! here's some cool commands for you to start${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"
	@IFS=$$'\n' ; \
  help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
  for help_line in $${help_lines[@]}; do \
      IFS=$$'#' ; \
      help_split=($$help_line) ; \
      help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
      help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
      printf "%-30s %s\n" $$help_command $$help_info ; \
  done

dist: ## Build for Production
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}Creating directories${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"
	mkdir -p dist/v2
	mkdir -p dist/vendor
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}Copying VENDOR${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"
	cp -R vendor/. dist/vendor
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}Copying API${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"
	cp -R src/. dist/v2
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}DONE!${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"

php-server: ## Starts PHP-Server
	@echo "${CYAN}${CLOUD}${NO_COLOR} ${GREEN}Starting PHP-Server${NO_COLOR} ${CYAN}${ARROW}${NO_COLOR}"
	cd src && php -S localhost:8888
