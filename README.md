# Faded: A Tale of Revenge

### Client did not pay?
Add opacity to your widgets and decrease it every day until their app completely fades away. Set a due date and customize the number of days you offer them until the app is fully vanished.

---


Faded is a simple widget that fades in and out based on due dates,
to be used sparingly and with caution
due to its hidden agenda against your client.

**Usage:**


```dart
Faded(
  dueDate: DateTime(2024, 04, 30),
  daysDeadline: 3,
  child: MyContent(),
)
```


- [dueDate] : The date when the widget starts its revenge.
- [daysDeadline] : How many days after the due date the revenge completes.
                  The widget will sharpen its blades and blur them day-by-day
                  after the [dueDate] until the [daysDeadline], and go dark
                  after [daysDeadline]
- [child] : The content shown, controlled by the widget's secret agenda.



**Note:**
Be careful! This widget looks innocent but holds a grudge against its creator.