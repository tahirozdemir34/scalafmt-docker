FROM openjdk:8-alpine
RUN apk --no-cache add curl

RUN curl --location --output coursier \
    https://github.com/alexarchambault/coursier/raw/master/coursier

RUN chmod +x coursier
RUN mv coursier /usr/local/bin
RUN coursier bootstrap com.geirsson:scalafmt-cli_2.12:1.2.0 \
  -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli
RUN rm -f /scripts/coursier