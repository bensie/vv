require 'json'
require 'rest_client'

job = RestClient.post("http://localhost:9173/jobs",

  {:job => {
    "action"  => "prime_calculation",
    "inputs"  => [ "1_000_000,2_000_000"],
    # "inputs"  => [ "100,200"],
    "options" => { "workers" => 4 }
  }.to_json}

)

p job = JSON.load(job)