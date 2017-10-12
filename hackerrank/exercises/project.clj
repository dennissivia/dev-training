(defproject exercises "0.1.0-SNAPSHOT"
  :description "Hackerrank clojure exercises"
  :url "https://github.com/scepticulous/hackerrank"
  :license {:name "GPL v3"
            :url "https://www.gnu.org/licenses/gpl-3.0.de.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [acyclic/squiggly-clojure "0.1.6"]
                 [org.clojure/core.typed "0.3.23"]
                 [funcool/cats "1.2.1"]
                 [cheshire "5.6.3"] ]
  :injections [(require 'clojure.core.typed)
               (clojure.core.typed/install)]
  :plugins [[lein-environ "1.0.0"]]
  :env {:squiggly {:checkers [:eastwood]}})
