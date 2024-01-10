import com.example.poc.Hello

def call(String name = null) {

    script {
        def config = loadConfig()
        String value = name ?: config.getProperty("NAME")

        Hello hello = new Hello()
        String greet = hello.sayHello(name)
        echo "${ greet}"
    }
}

private Properties loadConfig() {
    def config = libraryResources('config.properties')
    def props = new Properties();
    props.load(new StringReader(conf))
    return props
}