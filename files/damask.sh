CONTROL_JVM_OPTS="-Xms1g -Xmx4g"
#
# Uncomment the following GC settings if you see spikes in your throughput due to Garbage Collection.
#
# CONTROL_JVM_OPTS="$CONTROL_JVM_OPTS -XX:+UseG1GC"
#
# Uncomment if you get StackOverflowError.
# On 64 bit systems this value can be larger, e.g. -Xss16m
#
# CONTROL_JVM_OPTS="${CONTROL_JVM_OPTS} -Xss4m"
#
# Uncomment to set preference for IPv4 stack.
#
CONTROL_JVM_OPTS="${CONTROL_JVM_OPTS} -Djava.net.preferIPv4Stack=true"

CONTROL_JVM_OPTS="${CONTROL_JVM_OPTS} --add-opens=java.base/jdk.internal.misc=ALL-UNNAMED --add-opens=java.base/sun.nio.ch=ALL-UNNAMED --add-opens=java.base/sun.util.calendar=ALL-UNNAMED --add-opens=java.management/com.sun.jmx.mbeanserver=ALL-UNNAMED --add-opens=jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED --add-opens=java.base/sun.reflect.generics.reflectiveObjects=ALL-UNNAMED --add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.nio=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.base/java.util.concurrent.locks=ALL-UNNAMED --add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.math=ALL-UNNAMED --add-opens=java.sql/java.sql=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.time=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED --add-opens=java.management/sun.management=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED "

java ${CONTROL_JVM_OPTS} -jar /home/dmskadmin1/damask/damask_sync_api-1.0.jar &

echo $! > /home/dmskadmin1/damask/damask.pid
