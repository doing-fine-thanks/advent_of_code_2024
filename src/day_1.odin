package main

import "core:fmt"
import "core:os"
import "core:slice"
import "core:strconv"
import "core:strings"

input_path :: "input/day_1.txt"

main :: proc() {
	list_distance: int = 0

	data, ok := os.read_entire_file_or_err(input_path)
	defer delete(data)

	first_set_of_ids: [dynamic]int = {}
	second_set_of_ids: [dynamic]int = {}


	file_contents := string(data)
	for line in strings.split_lines_iterator(&file_contents) {
		parts := strings.split(line, "   ")
		append(&first_set_of_ids, strconv.atoi(parts[0]))
		append(&second_set_of_ids, strconv.atoi(parts[1]))
	}

	slice.sort(first_set_of_ids[:])
	slice.sort(second_set_of_ids[:])


	for i := 0; i < len(first_set_of_ids); i += 1 {
		list_distance += abs(first_set_of_ids[i] - second_set_of_ids[i])
	}


	fmt.printfln("[Day 1] the distance between the lists is: %d", list_distance)

	distance_score := 0
	for i in first_set_of_ids {
		occurence := 0
		for j in second_set_of_ids {
			if (i == j) {occurence += 1}
		}

		distance_score += i * occurence
	}

	fmt.printfln("[Day 1] the modified distance score between the lists is: %d", distance_score)
}
