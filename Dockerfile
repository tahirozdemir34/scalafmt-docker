FROM openjdk:8-alpine
RUN apk --no-cache add curl

RUN curl --location --output coursier \
    https://github.com/alexarchambault/coursier/raw/master/coursier

RUN chmod +x coursier
RUN mv coursier /usr/local/bin
RUN coursier bootstrap org.scalameta:scalafmt-cli_2.12:2.4.2 \
  -r sonatype:snapshots \
  -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli
RUN rm -f /scripts/coursier