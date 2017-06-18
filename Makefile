.PHONY: image run

pom.xml: project.clj
	lein pom


# NOTE: requires the following
# - json CLI tool: https://www.npmjs.com/package/json
# - moreutils: https://joeyh.name/code/moreutils/
project-info.json: pom.xml
	mvn -Dmaven.repo.local=$$(mktemp -d) \
		org.nixos.mvn2nix:mvn2nix-maven-plugin:mvn2nix
	@ perl -pi -e 's|(?<!:)//|/|g' $@
	@ json <$@ | sponge $@


result:
	@ nix-build --argstr system x86_64-linux


image: result
	@ docker load <$<


run: image
	@ docker run --rm -p 3000:3000 hello-world
