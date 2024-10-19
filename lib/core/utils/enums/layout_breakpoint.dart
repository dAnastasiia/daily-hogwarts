enum LayoutBreakpoint {
  xs(576),
  sm(768),
  md(900),
  l(1200),
  xl(1500),
  xxl(1800);

  final int width;

  const LayoutBreakpoint(this.width);
}
