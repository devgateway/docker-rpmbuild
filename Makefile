%:
	docker build -t rpmbuild:$@ -f $(subst -,/,$@)/Dockerfile .
