FROM alpine:3.13


# Copy the script into the container
COPY powertag2mqtt run.sh powertagd / 

# Make sure the script is executable
RUN chmod +x /run.sh

# Run the script
CMD ["ls"]

CMD ["/bin/sh", "/run.sh"]
