FROM maven:3.5.3-jdk-8

# aws toolkit
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"\
  && unzip awscli-bundle.zip\
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# make
RUN apt-get update && apt-get -yq install make

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
