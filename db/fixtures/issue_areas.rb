module Fixtures
  def issue_areas
    [{ title: "Demographics",                datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=1",  sort_order: 12 },
     { title: "Arts & Culture",              datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=2",  sort_order: 5  },
     { title: "Civic Vitality & Governance", datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=3",  sort_order: 9  },
     { title: "Economy",                     datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=4",  sort_order: 8  },
     { title: "Education",                   datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=5",  sort_order: 10 },
     { title: "Environment & Energy",        datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=6",  sort_order: 7  },
     { title: "Housing",                     datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=7",  sort_order: 4  },
     { title: "Land Use & Zoning",           datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=8",  sort_order: 6  },
     { title: "Public Health",               datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=9",  sort_order: 2  },
     { title: "Public Safety",               datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=10", sort_order: 1  },
     { title: "Technology",                  datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=11", sort_order: 11 },
     { title: "Transportation",              datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=12", sort_order: 3  },
     { title: "Geographic Boundaries",       datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=13", sort_order: nil },
     { title: "Equity",                      datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=9999", sort_order: nil }]
  end

  module_function :issue_areas
end