FROM oracle/graalvm-ce:19.0.0 as graalvm
COPY . /home/app/graal-mail
WORKDIR /home/app/graal-mail
RUN gu install native-image
RUN native-image --no-server -cp build/libs/graal-mail-*.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/graal-mail .
ENTRYPOINT ["./graal-mail"]
