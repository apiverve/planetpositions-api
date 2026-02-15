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
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }

        /// <summary>
        /// The latitude of the observer
        /// </summary>
        [JsonProperty("lat")]
        public string Lat { get; set; }

        /// <summary>
        /// The longitude of the observer
        /// </summary>
        [JsonProperty("lon")]
        public string Lon { get; set; }

        /// <summary>
        /// The altitude of the observer in meters
        /// </summary>
        [JsonProperty("alt")]
        public string Alt { get; set; }

        /// <summary>
        /// The planet to get position data for
        /// </summary>
        [JsonProperty("planet")]
        public string Planet { get; set; }
    }
}
