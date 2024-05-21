FROM openjdk:17.0.2

WORKDIR /app
COPY . .

EXPOSE 80
ENV LD_LIBRARY_PATH=/app/lib
CMD ["java", "--add-opens=java.base/java.net=ALL-UNNAMED", "--add-opens=java.base/java.util=ALL-UNNAMED", "--add-opens=java.base/java.lang=ALL-UNNAMED", "-Dlog4j2.configurationFactory=org.worldskills.cis.CISLogConfigFactory", "-Dlog4j2.configurationFile=log4j2.cis", "-Dorg.mortbay.jetty.Request.maxFormContentSize=-1", "-jar", "lib/cis.jar"]