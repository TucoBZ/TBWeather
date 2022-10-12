setup:
	@bundle install

build:
	@bundle exec pod install

clean:
	@rm -rf *.xcworkspace Pods/ build/