(defproject hello-world "0.1.0-SNAPSHOT"
  :description "Dockerized Clojure app via Nix"
  :url "https://github.com/yurrriq/nix-clojure-docker"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [ring/ring-core "1.6.1"]
                 [ring/ring-jetty-adapter "1.6.1"]]
  :main ^:skip-aot hello-world.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
