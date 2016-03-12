#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

originals = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Plats"]]//tr[td]//td[2]//a[not(@class="new")]/@title',
) 

replacements = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Ny ledamot"]]//tr[td]//td[position() = last()]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { sv: originals | replacements })

