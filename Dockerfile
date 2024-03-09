FROM eclipse-temurin:11-jdk-alpine

WORKDIR /bot

# Add libstdc++ since we are using an alpine image
RUN apk add --no-cache libstdc++

# Not going to bother with making this accept any other versions for now
ADD build/JMusicBot.jar JMusicBot.jar

# Start our bot
CMD ["java","-Dnogui","-jar","/bot/JMusicBot.jar"]
