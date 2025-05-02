import yaml

class NotificationYaml:
    def save_notification_title_to_yaml(self, title, path="../config/notification_data.yaml"):
        data = {
            'notifications': [
                {'title': title}
            ]
        }
        with open(path, 'w') as f:
            yaml.safe_dump(data, f, sort_keys=False)

    def get_notification_title_from_yaml(self, path="../config/notification_data.yaml"):
        with open(path, 'r') as f:
            data = yaml.safe_load(f)
        return data['notifications'][0]['title']
