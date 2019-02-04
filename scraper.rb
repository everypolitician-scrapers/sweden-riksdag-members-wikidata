#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

data = {}

data[:orig2014] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Plats"]]//tr[td]//td[2]//a[not(@class="new")][1]/@title',
  as_ids: true,
)

data[:replace2014] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Ny ledamot"]]//tr[td]//td[position() = last()]//a[not(@class="new")][1]/@title',
  as_ids: true,
)

data[:orig2018] = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2018%E2%80%932022',
  xpath: '//table[.//th[.="Plats"]]//tr[td]//td[2]//a[not(@class="new")][1]/@title',
  as_ids: true,
)

# has Property: "Riksdagen ID"
sparq = 'SELECT ?item WHERE { ?item wdt:P1214 ?id . }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids | data.values.flatten.uniq, batch_size: 250)

