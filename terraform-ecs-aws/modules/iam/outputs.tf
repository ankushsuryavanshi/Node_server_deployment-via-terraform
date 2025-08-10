output "task_execution_role_arn" {
  value = aws_iam_role.task_execution.arn
}

output "task_role_arn" {
  value = aws_iam_role.task_role.arn
}

output "ecs_task_sg_id" {
  value = aws_security_group.ecs_tasks_sg.id
}

