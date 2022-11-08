# frozen_string_literal: true

User.create! email: "test@example.com", password: "test"

JSON.parse(<<~JSON).each { |attributes| Product.create! attributes }
  [
    {
      "id": 5416019,
      "pattern_name": "Wrangler",
      "color_name": "Berry",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 0,
          "total": 107,
          "bolts": {
            "3514": { "quantity": 49.43, "dye_lot": "0" },
            "3216": { "quantity": 4.42, "dye_lot": "0" },
            "3230": { "quantity": 3.13, "dye_lot": "0" },
            "751477": { "quantity": 58.5, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416008,
      "pattern_name": "Wrangler",
      "color_name": "Sand",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 0,
          "total": 224,
          "bolts": {
            "3290": { "quantity": 8.89, "dye_lot": "0" },
            "706117": { "quantity": 55.6, "dye_lot": "0" },
            "706122": { "quantity": 55.2, "dye_lot": "0" },
            "721279": { "quantity": 55.0, "dye_lot": "0" },
            "706120": { "quantity": 50.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416017,
      "pattern_name": "Wrangler",
      "color_name": "Pottery",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 5,
          "total": 360,
          "bolts": {
            "3317": { "quantity": 30.59, "dye_lot": "71719" },
            "301409": { "quantity": 72.8, "dye_lot": "72219" },
            "301411": { "quantity": 69.7, "dye_lot": "72219" },
            "300237": { "quantity": 69.6, "dye_lot": "71719" },
            "300239": { "quantity": 62.3, "dye_lot": "71719" },
            "300240": { "quantity": 56.0, "dye_lot": "71719" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416044,
      "pattern_name": "Wrangler",
      "color_name": "Emerald",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 16,
          "total": 496,
          "bolts": {
            "3410": { "quantity": 20.06, "dye_lot": "0" },
            "2532": { "quantity": 7.2, "dye_lot": "0" },
            "759870": { "quantity": 58.0, "dye_lot": "0" },
            "759868": { "quantity": 57.2, "dye_lot": "0" },
            "759869": { "quantity": 55.2, "dye_lot": "0" },
            "759874": { "quantity": 55.0, "dye_lot": "0" },
            "721269": { "quantity": 54.35, "dye_lot": "0" },
            "759875": { "quantity": 50.3, "dye_lot": "0" },
            "759866": { "quantity": 50.0, "dye_lot": "0" },
            "759867": { "quantity": 50.0, "dye_lot": "0" },
            "759872": { "quantity": 40.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897022,
      "pattern_name": "Wrangler",
      "color_name": "Jungle",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 0,
          "total": 531,
          "bolts": {
            "8170": { "quantity": 29.31, "dye_lot": "0" },
            "8385": { "quantity": 22.35, "dye_lot": "0" },
            "471738": { "quantity": 60.0, "dye_lot": "0" },
            "471739": { "quantity": 60.0, "dye_lot": "0" },
            "471740": { "quantity": 60.0, "dye_lot": "0" },
            "471741": { "quantity": 60.0, "dye_lot": "0" },
            "471742": { "quantity": 60.0, "dye_lot": "0" },
            "471743": { "quantity": 60.0, "dye_lot": "0" },
            "471744": { "quantity": 60.0, "dye_lot": "0" },
            "471745": { "quantity": 60.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416010,
      "pattern_name": "Wrangler",
      "color_name": "Sahara",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 2,
          "total": 817,
          "bolts": {
            "3269": { "quantity": 24.98, "dye_lot": "0" },
            "1630": { "quantity": 12.91, "dye_lot": "0" },
            "721278": { "quantity": 61.89, "dye_lot": "0" },
            "706149": { "quantity": 58.7, "dye_lot": "0" },
            "706144": { "quantity": 58.0, "dye_lot": "0" },
            "721305": { "quantity": 57.74, "dye_lot": "0" },
            "706152": { "quantity": 57.3, "dye_lot": "0" },
            "706143": { "quantity": 56.8, "dye_lot": "0" },
            "706153": { "quantity": 56.0, "dye_lot": "0" },
            "706146": { "quantity": 55.1, "dye_lot": "0" },
            "706142": { "quantity": 55.0, "dye_lot": "0" },
            "706148": { "quantity": 55.0, "dye_lot": "0" },
            "706154": { "quantity": 55.0, "dye_lot": "0" },
            "706147": { "quantity": 51.9, "dye_lot": "0" },
            "706156": { "quantity": 51.0, "dye_lot": "0" },
            "706155": { "quantity": 50.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897008,
      "pattern_name": "Wrangler",
      "color_name": "Paprika",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 2,
          "total": 528,
          "bolts": {
            "460397": { "quantity": 60.0, "dye_lot": "0" },
            "460398": { "quantity": 60.0, "dye_lot": "0" },
            "460399": { "quantity": 60.0, "dye_lot": "0" },
            "460400": { "quantity": 60.0, "dye_lot": "0" },
            "460401": { "quantity": 60.0, "dye_lot": "0" },
            "460402": { "quantity": 60.0, "dye_lot": "0" },
            "460403": { "quantity": 60.0, "dye_lot": "0" },
            "460404": { "quantity": 60.0, "dye_lot": "0" },
            "417445": { "quantity": 47.87, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416050,
      "pattern_name": "Wrangler",
      "color_name": "Suede",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 0,
          "total": 272,
          "bolts": {
            "3265": { "quantity": 8.9, "dye_lot": "0" },
            "2564": { "quantity": 3.3, "dye_lot": "0" },
            "770956": { "quantity": 65.0, "dye_lot": "0" },
            "770957": { "quantity": 57.0, "dye_lot": "0" },
            "770954": { "quantity": 52.8, "dye_lot": "0" },
            "770953": { "quantity": 44.5, "dye_lot": "0" },
            "770952": { "quantity": 43.7, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416016,
      "pattern_name": "Wrangler",
      "color_name": "Apricot",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 6,
          "total": 240,
          "bolts": {
            "3462": { "quantity": 45.97, "dye_lot": "0" },
            "2538": { "quantity": 3.02, "dye_lot": "0" },
            "111992": { "quantity": 71.7, "dye_lot": "0" },
            "111990": { "quantity": 62.8, "dye_lot": "0" },
            "111988": { "quantity": 61.3, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416055,
      "pattern_name": "Wrangler",
      "color_name": "Taupe",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 4,
          "total": 486,
          "bolts": {
            "1670": { "quantity": 15.23, "dye_lot": "0" },
            "754000": { "quantity": 57.5, "dye_lot": "0" },
            "754002": { "quantity": 56.0, "dye_lot": "0" },
            "753999": { "quantity": 55.0, "dye_lot": "0" },
            "754001": { "quantity": 55.0, "dye_lot": "0" },
            "753995": { "quantity": 54.7, "dye_lot": "0" },
            "753994": { "quantity": 50.0, "dye_lot": "0" },
            "753996": { "quantity": 50.0, "dye_lot": "0" },
            "753997": { "quantity": 50.0, "dye_lot": "0" },
            "753998": { "quantity": 41.7, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2561828,
      "pattern_name": "Wrangler",
      "color_name": "Mist",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 3,
          "total": 508,
          "bolts": {
            "1934": { "quantity": 28.05, "dye_lot": "0" },
            "458605": { "quantity": 60.0, "dye_lot": "0" },
            "458606": { "quantity": 60.0, "dye_lot": "0" },
            "458607": { "quantity": 60.0, "dye_lot": "0" },
            "458608": { "quantity": 60.0, "dye_lot": "0" },
            "458609": { "quantity": 60.0, "dye_lot": "0" },
            "458610": { "quantity": 60.0, "dye_lot": "0" },
            "458611": { "quantity": 60.0, "dye_lot": "0" },
            "458612": { "quantity": 60.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416040,
      "pattern_name": "Wrangler",
      "color_name": "Glacier",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 4,
          "total": 15,
          "bolts": {
            "3521": { "quantity": 16.11, "dye_lot": "0" },
            "3520": { "quantity": 3.23, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 5416042,
      "pattern_name": "Wrangler",
      "color_name": "Everglade",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 1,
          "total": 57,
          "bolts": {
            "3518": { "quantity": 46.29, "dye_lot": "0" },
            "3101": { "quantity": 10.45, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 116.0
      }
    },
    {
      "id": 2897036,
      "pattern_name": "Wrangler",
      "color_name": "Honeycomb",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 7,
          "total": 265,
          "bolts": {
            "8380": { "quantity": 25.24, "dye_lot": "0" },
            "584715": { "quantity": 60.0, "dye_lot": "0" },
            "584716": { "quantity": 60.0, "dye_lot": "0" },
            "584717": { "quantity": 60.0, "dye_lot": "0" },
            "168018": { "quantity": 60.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2561809,
      "pattern_name": "Wrangler",
      "color_name": "Poppy",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 1,
          "total": 447,
          "bolts": {
            "1971": { "quantity": 27.73, "dye_lot": "0" },
            "473563": { "quantity": 60.0, "dye_lot": "0" },
            "473564": { "quantity": 60.0, "dye_lot": "0" },
            "473565": { "quantity": 60.0, "dye_lot": "0" },
            "473566": { "quantity": 60.0, "dye_lot": "0" },
            "473567": { "quantity": 60.0, "dye_lot": "0" },
            "473568": { "quantity": 60.0, "dye_lot": "0" },
            "473569": { "quantity": 60.0, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897004,
      "pattern_name": "Wrangler",
      "color_name": "Moss",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 33,
          "total": 459,
          "bolts": {
            "386017": { "quantity": 73.0, "dye_lot": "0" },
            "386011": { "quantity": 60.0, "dye_lot": "0" },
            "386012": { "quantity": 60.0, "dye_lot": "0" },
            "386013": { "quantity": 60.0, "dye_lot": "0" },
            "386014": { "quantity": 60.0, "dye_lot": "0" },
            "386015": { "quantity": 60.0, "dye_lot": "0" },
            "386016": { "quantity": 60.0, "dye_lot": "0" },
            "414798": { "quantity": 26.13, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897045,
      "pattern_name": "Wrangler",
      "color_name": "Jasmine",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 1,
          "total": 35,
          "bolts": { "435298": { "quantity": 34.66, "dye_lot": "0" } }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897059,
      "pattern_name": "Wrangler",
      "color_name": "Wheat",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 30,
          "total": 667,
          "bolts": {
            "479915": { "quantity": 60.0, "dye_lot": "0" },
            "479916": { "quantity": 60.0, "dye_lot": "0" },
            "479917": { "quantity": 60.0, "dye_lot": "0" },
            "479918": { "quantity": 60.0, "dye_lot": "0" },
            "479919": { "quantity": 60.0, "dye_lot": "0" },
            "479920": { "quantity": 60.0, "dye_lot": "0" },
            "479921": { "quantity": 60.0, "dye_lot": "0" },
            "479922": { "quantity": 60.0, "dye_lot": "0" },
            "479923": { "quantity": 60.0, "dye_lot": "0" },
            "479924": { "quantity": 60.0, "dye_lot": "0" },
            "479912": { "quantity": 55.0, "dye_lot": "0" },
            "363559": { "quantity": 11.63, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897029,
      "pattern_name": "Wrangler",
      "color_name": "Jute",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 1,
          "total": 376,
          "bolts": {
            "8382": { "quantity": 6.34, "dye_lot": "0" },
            "492843": { "quantity": 60.0, "dye_lot": "0" },
            "492844": { "quantity": 60.0, "dye_lot": "0" },
            "492845": { "quantity": 60.0, "dye_lot": "0" },
            "492846": { "quantity": 60.0, "dye_lot": "0" },
            "492847": { "quantity": 60.0, "dye_lot": "0" },
            "492848": { "quantity": 60.0, "dye_lot": "0" },
            "368499": { "quantity": 10.34, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    },
    {
      "id": 2897074,
      "pattern_name": "Wrangler",
      "color_name": "Lacquer",
      "price": {
        "usd": {
          "per_unit": { "single": 19.0, "export": 17.0, "tiered": null },
          "per_piece": 11.95,
          "per_piece_export": 11.65,
          "per_halfpiece": 12.45,
          "per_halfpiece_export": 12.15
        },
        "cad": {
          "per_piece": null,
          "per_piece_export": null,
          "per_halfpiece": null,
          "per_halfpiece_export": null,
          "per_unit": { "single": 32.3, "export": 28.9, "tiered": null }
        },
        "search_reference": 19.0
      },
      "stock": {
        "current": {
          "memos": 5,
          "total": 225,
          "bolts": {
            "368500": { "quantity": 67.0, "dye_lot": "0" },
            "368501": { "quantity": 61.5, "dye_lot": "0" },
            "368502": { "quantity": 60.0, "dye_lot": "0" },
            "420778": { "quantity": 36.04, "dye_lot": "0" }
          }
        },
        "expected": [],
        "availability": "",
        "total_reserved": 0.0
      }
    }
  ]
JSON
