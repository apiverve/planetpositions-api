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
        /// The date to get planetary position data for (MM-DD-YYYY)
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }

        /// <summary>
        /// The time of day for the calculation (HH:mm format, 24-hour). Defaults to 00:00 if not provided
        /// </summary>
        [JsonProperty("time")]
        public string Time { get; set; }

        /// <summary>
        /// The latitude of the observer
        /// </summary>
        [JsonProperty("lat")]
        public double Lat { get; set; }

        /// <summary>
        /// The longitude of the observer
        /// </summary>
        [JsonProperty("lon")]
        public double Lon { get; set; }

        /// <summary>
        /// The altitude of the observer in meters
        /// </summary>
        [JsonProperty("alt")]
        public double? Alt { get; set; }

        /// <summary>
        /// The planet to get position data for
        /// </summary>
        [JsonProperty("planet")]
        public string Planet { get; set; }
    }
}
