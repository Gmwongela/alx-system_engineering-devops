#!/usr/bin/python3
import requests
import sys

def gather_data(employee_id):
    # Define the actual API endpoint using the provided base URL
    base_url = "https://jsonplaceholder.typicode.com/"
    endpoint = f"users/{employee_id}"
    url = base_url + endpoint

    try:
        # Make a GET request to the API
        response = requests.get(url)

        # Check if the response status code is 200 (OK)
        if response.status_code == 200:
            # Parse the JSON response
            data = response.json()

            # Extract relevant information
            employee_name = data['name']
            # Get the employee's TODO list
            todo_list_url = base_url + f"todos?userId={employee_id}"
            todo_list_response = requests.get(todo_list_url)
            todo_list = todo_list_response.json()
            total_tasks = len(todo_list)
            completed_tasks = sum(1 for task in todo_list if task['completed'])

            # Print the information in the specified format
            print(f"Employee {employee_name} is done with tasks({completed_tasks}/{total_tasks}):")
            for task in todo_list:
                if task['completed']:
                    print(f"    {task['title']}")

        else:
            print("Error: Unable to fetch data from the API")

    except requests.exceptions.RequestException as e:
        print(f"Request Exception: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 0-gather_data_from_an_API.py <employee_id>")
        sys.exit(1)

    employee_id = sys.argv[1]
    gather_data(employee_id)
