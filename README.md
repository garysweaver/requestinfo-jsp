Requestinfo
=====

A simple Java webapp called "requestinfo" that outputs information about the request.

### Technical Detail

It is basically just a scriptlet that outputs request information in plain text.

The precompiled version uses JSPC to precompile this to make it just a little bit faster on first hit. This was compiled in Java 1.4 to hopefully be compatible with most environments. If you have any trouble with the precompiled JSP, use the war without precompiled JSP download.

### Download

War without precompiled JSP: [requestinfo.war][war]

OR

War with JSP precompiled with JSPC in Java 1.4: [requestinfo.war][jspc]

### Deploy

Copy it into the webapps directory in Tomcat or the appropriate place in your Java application server, assuming you have it configured to automatically extract/deploy war files.

### Use

Using a browser or other means, make a request to the requestinfo webapp (for example: http://yourserver/requestinfo/ ) to see the host and domain of the server.

### Build

If you need to build it, first install Maven 2 and Java, then use the command:

    mvn clean install
    
The built war should be in target/requestinfo.war

#### Troubleshooting Precompiled JSP Issues

By default, this compiles the JSP using the current version of Java available to Maven, which can be defined by JAVA_HOME. If you need to build the non-precompiled version, then remove the JSPC plugin section from the pom.xml before building.

e.g. in OS X 10.6 (Snow Leopard), to build with Java 1.4 on newer systems, you must first [install Java 1.4][java4snowleopard], then use the following to set the Java version to 1.4 prior to build (if using bash, the default):

    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.4/Home/

To validate the version of Java used to compile the JSP:

1. Change your current directory to the exploded war's (webapps)/requestinfo/WEB-INF/classes/jsp/ or cd to the target directory, unzip/unwar requestinfo.war, then change directory into the compiled jsp directory, e.g.:

        cd target
        unzip requestinfo.war
        cd WEB-INF/classes/jsp/ 
2. Use the command (make sure that a version of Java containing javap is in your PATH):

        javap -verbose index_jsp
3. In probably the tenth line of output, you possibly will see something like:

          minor version: 0
          major version: 48
4. Match the major and minor version provided by javap to the table below to ensure the class was built in the version less or equal to the version of Java on the server (thanks to [Réal's How To][javaclassversion]):

        major  minor Java platform version 
        45       3           1.0
        45       3           1.1
        46       0           1.2
        47       0           1.3
        48       0           1.4
        49       0           1.5 (5.0)
        50       0           1.6 (6.0)
        51       0           1.7 (7.0)
5. If the major/minor version aren't the same or lower/compatible with the version of Java that the application server is using in Tomcat, then recompile the war with an appropriate version, or use the non-precompiled version.

### License

Copyright (c) 2011 Gary S. Weaver, released under the [MIT license][lic].

[war]: https://github.com/garysweaver/requestinfo-jsp/raw/master/dist/notcompiled/requestinfo.war
[jspc]: https://github.com/garysweaver/requestinfo-jsp/raw/master/dist/compiled/requestinfo.war
[java4snowleopard]: http://tedwise.com/2009/09/25/using-java-1-5-and-java-1-4-on-snow-leopard/
[javaclassversion]: http://www.rgagnon.com/javadetails/java-0544.html
[lic]: http://github.com/garysweaver/requestinfo-jsp/blob/master/LICENSE
