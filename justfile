build:
    mvn -DskipTests package

plain-run:
    java -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main

aot-generate: build
    java -XX:AOTMode=record -XX:AOTConfiguration=target/app.aotconf -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main
    java -XX:AOTMode=create -XX:AOTConfiguration=target/app.aotconf -XX:AOTCache=target/app.aot -cp target/java-24-in-action-1.0-SNAPSHOT.jar

aot-run:
    java -XX:AOTCache=target/app.aot -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main

cds-generate: build
    java -Xshare:off -XX:DumpLoadedClassList=target/app.classlist -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main
    java -Xshare:dump -XX:SharedArchiveFile=target/app.jsa -XX:SharedClassListFile=target/app.classlist -cp target/java-24-in-action-1.0-SNAPSHOT.jar

cds-run:
    java -XX:SharedArchiveFile=target/app.jsa -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main

bench-mark:
    time java -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main
    sleep 5
    time java -XX:SharedArchiveFile=target/app.jsa -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main
    sleep 5
    time java -XX:AOTCache=target/app.aot -cp target/java-24-in-action-1.0-SNAPSHOT.jar org.mvnsearch.Main
