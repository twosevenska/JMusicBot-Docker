FROM lwieske/java-8:jdk-8u181-slim

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
