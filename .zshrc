
function _update_ps1()
{
	export PROMPT="$(~/powerline-zsh.py $?)"
    # source $ZSH/lib/completion.zsh
    # source "$ZSH/lib/history.zsh"
    # source "$ZSH/lib/key-bindings.zsh"
}

precmd()
{
	_update_ps1
}

source ~/.aliases
bindkey '[C' forward-word # alt + ->
bindkey '[D' backward-word # alt + <-

export HADOOP_DATANODE_OPTS=-Dcom.sun.management.jmxremote
export HADOOP_JOBTRACKER_OPTS=-Dcom.sun.management.jmxremote
export HADOOP_HOME=/opt/ue1b-qaB-cdh5.2.1/hadoop-2.5.0-cdh5.2.1
export HBASE_HOME=/opt/ue1b-qaB-cdh5.2.1/hbase-0.98.6-cdh5.2.1
export OOZIE_URL=http://ue1b-devBu1:11000/oozie
export HIVE_HOME=/opt/ue1b-qaB-cdh5.2.1/hive-0.13.1-cdh5.2.1
export HBASE_CONF_DIR=/Users/ylaurence/cluster-config
export HADOOP_CLIENT_OPTS="-Xms268435456 -Xmx268435456 -Djava.net.preferIPv4Stack=true"
export HADOOP_CLASSPATH=/opt/ue1b-qaB-cdh5.2.1/hadoop-2.5.0-cdh5.2.1/share/hadoop/mapreduce2/hadoop-mapreduce-client-core-2.5.0-cdh5.2.1.jar:
export HADOOP_CONF_DIR=/Users/ylaurence/cluster-config
export OOZIE_CONF_DIR=/Users/ylaurence/cluster-config
export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
export HADOOP_SECONDARYNAMENODE_OPTS=-Dcom.sun.management.jmxremote
export HADOOP_BALANCER_OPTS=-Dcom.sun.management.jmxremote
export HADOOP_NAMENODE_OPTS=-Dcom.sun.management.jmxremote
export HADOOP_MAPRED_HOME=/opt/ue1b-qaB-cdh5.2.1/hadoop-2.5.0-cdh5.2.1
export OOZIE_HOME=/opt/ue1b-qaB-cdh5.2.1/oozie-4.0.0-cdh5.2.1
export HIVE_CONF_DIR=/Users/ylaurence/cluster-config
export PATH=/opt/ue1b-qaB-cdh5.2.1/hadoop-2.5.0-cdh5.2.1/bin:/opt/ue1b-qaB-cdh5.2.1/hbase-0.98.6-cdh5.2.1/bin:/opt/ue1b-qaB-cdh5.2.1/hive-0.13.1-cdh5.2.1/bin:/opt/ue1b-qaB-cdh5.2.1/oozie-4.0.0-cdh5.2.1/bin:$PATH

HISTSIZE=10000
SAVEHIST=10000
