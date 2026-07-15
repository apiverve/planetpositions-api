declare module '@apiverve/planetpositions' {
  export interface planetpositionsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface planetpositionsResponse {
    status: string;
    error: string | null;
    data: PlanetPositionsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PlanetPositionsData {
      planet:         null | string;
      isBelowHorizon: boolean | null;
      date:           Date | null;
      observer:       Observer;
      rightAscension: HourAngle;
      declination:    Declination;
      distance:       Distance;
      siderealTime:   HourAngle;
      hourAngle:      HourAngle;
      vectors:        Vectors;
  }
  
  interface Declination {
      degrees: number | null;
      minutes: number | null;
      seconds: number | null;
  }
  
  interface Distance {
      km:                 number | null;
      lightTravelSeconds: number | null;
      astronomicalUnits:  number | null;
  }
  
  interface HourAngle {
      hours:   number | null;
      minutes: number | null;
      seconds: number | null;
  }
  
  interface Observer {
      latitude:  number | null;
      longitude: number | null;
  }
  
  interface Vectors {
      x: number | null;
      y: number | null;
      z: number | null;
  }

  export default class planetpositionsWrapper {
    constructor(options: planetpositionsOptions);

    execute(callback: (error: any, data: planetpositionsResponse | null) => void): Promise<planetpositionsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: planetpositionsResponse | null) => void): Promise<planetpositionsResponse>;
    execute(query?: Record<string, any>): Promise<planetpositionsResponse>;
  }
}
