FROM solr:6.4
LABEL maintainer Zsolt Czinkos <czinkos@gmail.com>
LABEL description "Solr image with SolrTextTagger"
LABEL version="1.0"

USER root
ADD http://central.maven.org/maven2/org/opensextant/solr-text-tagger/2.4/solr-text-tagger-2.4.jar /opt/solr/server/solr/lib/
RUN chown solr.solr -R /opt/solr/server/solr/lib/solr-text-tagger-2.4.jar 
USER solr

EXPOSE 8983
