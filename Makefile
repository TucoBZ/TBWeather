setup:
	@bundle install
	@cp Templates/Secrets.plist TBWeather/Resource/Properties/Secrets.plist

clean:
	@rm -rf *.xcworkspace Pods/ build/