(ns hello-world.core
  (:require [ring.adapter.jetty :as ring-jetty])
  (:gen-class))


(defn handler [req]
  {:status 200
   :headers {"Content-Type" "text/plain"}
   :body "Hello, world!"})


(defn -main [& args]
  (ring-jetty/run-jetty handler {:port 3000}))
