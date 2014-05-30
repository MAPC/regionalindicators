module Fixtures
  def issue_areas
    [{ id: 1,  title: "Demographics",                datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=1",  sort_order: 12 },
     { id: 2,  title: "Arts & Culture",              datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=2",  sort_order: 5  },
     { id: 3,  title: "Civic Vitality & Governance", datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=3",  sort_order: 9  },
     { id: 4,  title: "Economy",                     datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=4",  sort_order: 8  },
     { id: 5,  title: "Education",                   datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=5",  sort_order: 10 },
     { id: 6,  title: "Environment & Energy",        datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=6",  sort_order: 7  },
     { id: 7,  title: "Housing",                     datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=7",  sort_order: 4  },
     { id: 8,  title: "Land Use & Zoning",           datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=8",  sort_order: 6  },
     { id: 9,  title: "Public Health",               datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=9",  sort_order: 2  },
     { id: 10, title: "Public Safety",               datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=10", sort_order: 1  },
     { id: 11, title: "Technology",                  datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=11", sort_order: 11 },
     { id: 12, title: "Transportation",              datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=12", sort_order: 3  },
     { id: 13, title: "Geographic Boundaries",       datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=13", sort_order: nil },
     { id: 14, title: "Equity",                      datacommon_url: "http://metrobostondatacommon.org/explore/gallery/?topics=9999", sort_order: nil }]
  end

  module_function :issue_areas
end