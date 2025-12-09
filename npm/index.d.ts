declare module '@apiverve/planetpositions' {
  export interface planetpositionsOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface planetpositionsResponse {
    status: string;
    error: string | null;
    data: PlanetPositionsData;
    code?: number;
  }


  interface PlanetPositionsData {
      planet:         string;
      isBelowHorizon: boolean;
      date:           Date;
      observer:       Observer;
      rightAscension: HourAngle;
      declination:    Declination;
      distance:       Distance;
      siderealTime:   HourAngle;
      hourAngle:      HourAngle;
      vectors:        Vectors;
  }
  
  interface Declination {
      degrees: number;
      minutes: number;
      seconds: number;
  }
  
  interface Distance {
      km:                 number;
      lightTravelSeconds: number;
      astronomicalUnits:  number;
  }
  
  interface HourAngle {
      hours:   number;
      minutes: number;
      seconds: number;
  }
  
  interface Observer {
      latitude:  number;
      longitude: number;
  }
  
  interface Vectors {
      x: number;
      y: number;
      z: number;
  }

  export default class planetpositionsWrapper {
    constructor(options: planetpositionsOptions);

    execute(callback: (error: any, data: planetpositionsResponse | null) => void): Promise<planetpositionsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: planetpositionsResponse | null) => void): Promise<planetpositionsResponse>;
    execute(query?: Record<string, any>): Promise<planetpositionsResponse>;
  }
}
