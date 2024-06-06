
# i need to learn how build from works
# faced issue with container not being ubuntu and thus apt not being found :p
# got an error ash exit code 127 for apt

#ARG BUILD_FROM=ubuntu
FROM ubuntu as build


WORKDIR /powertagd
COPY ./src ./
RUN ls

RUN apt update && apt install make gcc libssl-dev  -y
# RUN apt-get install libssl-dev -y

RUN ls
RUN make


# Stage 2: Create the final Docker image
ARG BUILD_FROM
FROM ubuntu
WORKDIR /app


# Copy the built binary and other necessary files from the build stage
COPY --from=build /powertagd/* ./
COPY powertag2mqtt run.sh ./

# Make the shell script executable
RUN chmod +x ./run.sh
RUN chmod +x ./powertag2mqtt
RUN chmod +x ./powertagd

# Specify the command to run your application using the shell script
CMD ["./run.sh"]
