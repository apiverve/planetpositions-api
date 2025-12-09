// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     PlanetPositionsData data = Converter.fromJsonString(jsonString);

package com.apiverve.planetpositions.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static PlanetPositionsData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(PlanetPositionsData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(PlanetPositionsData.class);
        writer = mapper.writerFor(PlanetPositionsData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// PlanetPositionsData.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;
import java.time.OffsetDateTime;

public class PlanetPositionsData {
    private String planet;
    private boolean isBelowHorizon;
    private OffsetDateTime date;
    private Observer observer;
    private HourAngle rightAscension;
    private Declination declination;
    private Distance distance;
    private HourAngle siderealTime;
    private HourAngle hourAngle;
    private Vectors vectors;

    @JsonProperty("planet")
    public String getPlanet() { return planet; }
    @JsonProperty("planet")
    public void setPlanet(String value) { this.planet = value; }

    @JsonProperty("isBelowHorizon")
    public boolean getIsBelowHorizon() { return isBelowHorizon; }
    @JsonProperty("isBelowHorizon")
    public void setIsBelowHorizon(boolean value) { this.isBelowHorizon = value; }

    @JsonProperty("date")
    public OffsetDateTime getDate() { return date; }
    @JsonProperty("date")
    public void setDate(OffsetDateTime value) { this.date = value; }

    @JsonProperty("observer")
    public Observer getObserver() { return observer; }
    @JsonProperty("observer")
    public void setObserver(Observer value) { this.observer = value; }

    @JsonProperty("rightAscension")
    public HourAngle getRightAscension() { return rightAscension; }
    @JsonProperty("rightAscension")
    public void setRightAscension(HourAngle value) { this.rightAscension = value; }

    @JsonProperty("declination")
    public Declination getDeclination() { return declination; }
    @JsonProperty("declination")
    public void setDeclination(Declination value) { this.declination = value; }

    @JsonProperty("distance")
    public Distance getDistance() { return distance; }
    @JsonProperty("distance")
    public void setDistance(Distance value) { this.distance = value; }

    @JsonProperty("siderealTime")
    public HourAngle getSiderealTime() { return siderealTime; }
    @JsonProperty("siderealTime")
    public void setSiderealTime(HourAngle value) { this.siderealTime = value; }

    @JsonProperty("hourAngle")
    public HourAngle getHourAngle() { return hourAngle; }
    @JsonProperty("hourAngle")
    public void setHourAngle(HourAngle value) { this.hourAngle = value; }

    @JsonProperty("vectors")
    public Vectors getVectors() { return vectors; }
    @JsonProperty("vectors")
    public void setVectors(Vectors value) { this.vectors = value; }
}

// Declination.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;

public class Declination {
    private long degrees;
    private long minutes;
    private long seconds;

    @JsonProperty("degrees")
    public long getDegrees() { return degrees; }
    @JsonProperty("degrees")
    public void setDegrees(long value) { this.degrees = value; }

    @JsonProperty("minutes")
    public long getMinutes() { return minutes; }
    @JsonProperty("minutes")
    public void setMinutes(long value) { this.minutes = value; }

    @JsonProperty("seconds")
    public long getSeconds() { return seconds; }
    @JsonProperty("seconds")
    public void setSeconds(long value) { this.seconds = value; }
}

// Distance.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;

public class Distance {
    private double km;
    private double lightTravelSeconds;
    private double astronomicalUnits;

    @JsonProperty("km")
    public double getKM() { return km; }
    @JsonProperty("km")
    public void setKM(double value) { this.km = value; }

    @JsonProperty("lightTravelSeconds")
    public double getLightTravelSeconds() { return lightTravelSeconds; }
    @JsonProperty("lightTravelSeconds")
    public void setLightTravelSeconds(double value) { this.lightTravelSeconds = value; }

    @JsonProperty("astronomicalUnits")
    public double getAstronomicalUnits() { return astronomicalUnits; }
    @JsonProperty("astronomicalUnits")
    public void setAstronomicalUnits(double value) { this.astronomicalUnits = value; }
}

// HourAngle.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;

public class HourAngle {
    private long hours;
    private long minutes;
    private long seconds;

    @JsonProperty("hours")
    public long getHours() { return hours; }
    @JsonProperty("hours")
    public void setHours(long value) { this.hours = value; }

    @JsonProperty("minutes")
    public long getMinutes() { return minutes; }
    @JsonProperty("minutes")
    public void setMinutes(long value) { this.minutes = value; }

    @JsonProperty("seconds")
    public long getSeconds() { return seconds; }
    @JsonProperty("seconds")
    public void setSeconds(long value) { this.seconds = value; }
}

// Observer.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;

public class Observer {
    private double latitude;
    private double longitude;

    @JsonProperty("latitude")
    public double getLatitude() { return latitude; }
    @JsonProperty("latitude")
    public void setLatitude(double value) { this.latitude = value; }

    @JsonProperty("longitude")
    public double getLongitude() { return longitude; }
    @JsonProperty("longitude")
    public void setLongitude(double value) { this.longitude = value; }
}

// Vectors.java

package com.apiverve.planetpositions.data;

import com.fasterxml.jackson.annotation.*;

public class Vectors {
    private double x;
    private double y;
    private double z;

    @JsonProperty("x")
    public double getX() { return x; }
    @JsonProperty("x")
    public void setX(double value) { this.x = value; }

    @JsonProperty("y")
    public double getY() { return y; }
    @JsonProperty("y")
    public void setY(double value) { this.y = value; }

    @JsonProperty("z")
    public double getZ() { return z; }
    @JsonProperty("z")
    public void setZ(double value) { this.z = value; }
}