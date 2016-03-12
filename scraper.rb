#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

originals_2010 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2010%E2%80%932014',
  after: '//span[@id="Nuvarande_ledam.C3.B6ter"]',
  before: '//span[@id="Ledam.C3.B6ter_som_avg.C3.A5tt"]',
  xpath: '//table//tr[td]//td[2]//a[not(@class="new")]/@title',
) 

replacements_2010 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2010%E2%80%932014',
  after: '//span[@id="Ledam.C3.B6ter_som_avg.C3.A5tt"]',
  before: '//span[@id="K.C3.A4llor"]',
  xpath: '//table//tr[td]//td[2]//a[not(@class="new")]/@title',
) 

originals_2014 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Plats"]]//tr[td]//td[2]//a[not(@class="new")]/@title',
) 

replacements_2014 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://sv.wikipedia.org/wiki/Lista_%C3%B6ver_ledam%C3%B6ter_av_Sveriges_riksdag_2014%E2%80%932018',
  xpath: '//table[.//th[.="Ny ledamot"]]//tr[td]//td[position() = last()]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { sv: originals_2010 | replacements_2010 | originals_2014 | replacements_2014 })

