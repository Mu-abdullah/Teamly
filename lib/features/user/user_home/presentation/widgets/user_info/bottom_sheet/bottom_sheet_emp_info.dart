import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/services/status/job_status.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../auth/data/models/emp_model.dart';

class BottomSheetEmpInfo extends StatelessWidget {
  const BottomSheetEmpInfo({super.key, required this.empInfo});
  final EmpModel empInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white.withValues(alpha: 0.15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade100.withValues(alpha: 0.3),
                Colors.white.withValues(alpha: 0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeaderSection(context),
                    const SizedBox(height: 16),
                    _buildInfoSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue.shade600,
          child: Text(
            empInfo.name!.isNotEmpty ? empInfo.name![0].toUpperCase() : '?',
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                empInfo.name!,
                translate: false,
                isTitle: true,
                color: Colors.blue.shade900,
                fontSize: 24,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: JobStatus.statusColor(
                        empInfo.jobStatus!,
                      ).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppText(
                      JobStatus.jobStatus(empInfo.jobStatus!),
                      color: JobStatus.statusColor(empInfo.jobStatus!),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: AppText(
          LangKeys.userInfo,
          color: Colors.blue.shade800,
          fontSize: 18,
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.all(8),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(LangKeys.id, empInfo.id!),
          _buildInfoRow(LangKeys.position, empInfo.position.positionName!),
          _buildInfoRow(LangKeys.nid, empInfo.nid!),
          _buildInfoRow(LangKeys.address, empInfo.address!),
          _buildInfoRow(LangKeys.phone, empInfo.phone!),
          _buildInfoRow(LangKeys.startIn, empInfo.startIn!),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: AppText(label, color: Colors.grey.shade600, fontSize: 14),
          ),
          Expanded(
            child: AppText(
              value,
              translate: false,
              color: Colors.grey.shade800,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
