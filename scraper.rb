#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

svwiki = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2018%E2%80%932022',
  xpath: '//table[.//th[.="Plats"]]//tr[td]//td[2]//a[not(@class="new")][1]/@title',
  as_ids: true,
)

# has Property: "Riksdagen ID"
sparq = 'SELECT ?item WHERE { ?item wdt:P1214 ?id . }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids | svwiki, batch_size: 250)

