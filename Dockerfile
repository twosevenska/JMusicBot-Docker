FROM kubespheredev/java-11-runtime@sha256:272494b580cdf400ffce833eda0d437ceb45e8663f3db183b95325674c40a788

WORKDIR /bot

# Add libstdc++ since we are using an alpine image
RUN apk add --no-cache libstdc++

# Not going to bother with making this accept any other versions for now
ADD build/JMusicBot.jar JMusicBot.jar

# Add the missing libconnector.so for arm devices, again lazily doing this
RUN mkdir -p natives/linux-arm \
	&& wget -q -P natives/linux-arm https://cdn.discordapp.com/attachments/154460214769221632/414242970540441620/libconnector.so 
RUN jar -uf JMusicBot.jar natives/linux-arm/libconnector.so \
	&& rm -rf natives

# Start our bot
CMD ["java","-Dnogui","-jar","/bot/JMusicBot.jar"]
