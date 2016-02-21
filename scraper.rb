#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//h2[span[@id="Invalda_ledam.C3.B6ter"]]//following-sibling::table[1]//tr[td]//td[2]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { sv: names })
warn EveryPolitician::Wikidata.notify_rebuilder

