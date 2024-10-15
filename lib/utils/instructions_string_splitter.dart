List<String> splitInstructions(String instructions) {
  return instructions
      .split(RegExp(
          r'\d+\.\s+')) // Split by numbers followed by a period and space
      .map((step) => step.trim()) // Trim each step
      .where((step) => step.isNotEmpty) // Filter out empty strings
      .toList();
}
