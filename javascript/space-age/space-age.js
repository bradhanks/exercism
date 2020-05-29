export const age = (planet, seconds) => {
  return Math.round(100 * seconds / totalSeconds(planet))/100;
};

const totalSeconds = (planet) => {
  return earthYears(planet) * 86400 * 365.25
};

function earthYears(planet) {
  try {
      return yearsTable[planet];
  } catch {
      throw new Error('planetLookup function has a problem!');
  }
}

export const yearsTable = {
"mercury": 0.2408467,
"venus":   0.61519726,
"earth":   1,
"mars":    1.8808158,
"jupiter": 11.862615,
"saturn":  29.447498,
"uranus":  84.016846,
"neptune": 164.79132
};