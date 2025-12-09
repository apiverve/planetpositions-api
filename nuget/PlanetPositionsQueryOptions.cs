using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PlanetPositions
{
    /// <summary>
    /// Query options for the Planet Positions API
    /// </summary>
    public class PlanetPositionsQueryOptions
    {
        /// <summary>
        /// The date and time to get planetary position data for (YYYY-MM-DD HH:MM:SS)
        /// Example: 2023-10-14 21:00:00
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }

        /// <summary>
        /// The latitude of the observer to get planetary position data for
        /// Example: 37.7749
        /// </summary>
        [JsonProperty("lat")]
        public string Lat { get; set; }

        /// <summary>
        /// The longitude of the observer to get planetary position data for
        /// Example: -122.4194
        /// </summary>
        [JsonProperty("lon")]
        public string Lon { get; set; }

        /// <summary>
        /// The altitude of the observer to get planetary position data for (in meters)
        /// Example: 0
        /// </summary>
        [JsonProperty("alt")]
        public string Alt { get; set; }

        /// <summary>
        /// The planet to get planetary position data for (e.g. sun, moon, mercury, venus, mars, jupiter, saturn, uranus, neptune, pluto)
        /// Example: sun, moon, mercury, venus, mars, jupiter, saturn, uranus, neptune, pluto
        /// </summary>
        [JsonProperty("planet")]
        public string Planet { get; set; }
    }
}
