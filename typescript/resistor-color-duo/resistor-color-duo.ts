const RESISTOR_VALUES = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9,
};

type Color = keyof typeof RESISTOR_VALUES;

export class ResistorColor {
  private colors: Color[];
  constructor(colors: Color[]) {
    this.colors = colors;
    if (this.colors.length < 2)
      throw new Error("At least two colors need to be present");
  }

  value = (): number => {
    const [firstColor, secondColor] = this.colors;
    return RESISTOR_VALUES[firstColor] * 10 + RESISTOR_VALUES[secondColor];
  };
}
